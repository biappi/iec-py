import serial
import functools

levels = {
    'S': 'SUCCESS',
    'I': 'INFO   ',
    'W': 'WARNING',
    'E': 'ERROR  ',
}

facilities = {
    'C':   'COMMAND',
    '>':   'SER >',
    '<':   'SER <',
    'IN':  'COM IN',
    'OUT': 'COM OUT',
}

ignored_facilities = (
    'SER <',
    'SER >',
)

class Logger:
    def __init__(self):
        self.facilities = { k: v for k, v in facilities.iteritems() }
        self.fac_max = max((len(i) for i in self.facilities.itervalues()))
        self.log_fmt = '%-{}s - %s'.format(self.fac_max)

    def register_facility(self, char, name):
        self.facilities[char] = name
        self.fac_max = max(self.fac_max, len(name))
        self.log_fmt = '%-{}s - %s'.format(self.fac_max)

    def log(self, facil, mesg):
        if self.facilities[facil] in ignored_facilities: return
        print self.log_fmt % (self.facilities[facil], mesg)

log = Logger()

class Serial(serial.Serial):
    def __init__(self):
        self.log_out = functools.partial(log.log, '>')
        self.log_in  = functools.partial(log.log, '<')

        self.todump_in  = ''
        self.todump_out = ''

        serial.Serial.__init__(
            self,
           '/dev/cu.usbmodem1d1141', 
            115200,
        )

    def write(self, s):
        self.log_out(repr(s))
        self.todump_out += s
        serial.Serial.write(self, s)

    def read(self, howmuch=None):
        if howmuch is None:
            c = serial.Serial.read(self)
            self.todump_in += c
            self.log_in(repr(c))
            return c
        else:
            x = serial.Serial.read(self, howmuch)
            self.todump_in += x
            self.log_in( repr(x))
            return x

    def readline(self):
        incoming = ''

        while not incoming.endswith('\r'):
            incoming += serial.Serial.read(self)

        self.todump_in += incoming
        self.log_in(repr(incoming))
        return incoming

    def dump_in(self):
        log.log('IN', repr(self.todump_in))
        self.todump_in = ''

    def dump_out(self):
        log.log('OUT', repr(self.todump_out))
        self.todump_out = ''

def register_facility_string(ser):
    line = ser.readline()
    ser.dump_in()
    log.register_facility(line[0], line[1:-1])

def debug_output(ser):
    line  = ser.readline()
    ser.todump_in = ''

    level = line[0]
    facil = line[1]
    mesg  = line[2:]
    log.log(facil, mesg)

def request_file_size(ser):
    ser.dump_in()
    filesize = 0
    hi = chr((filesize >> 8) | 0xff)
    lo = chr((filesize >> 0) | 0xff)
    ser.write('S' + hi + lo)
    ser.dump_out()

def open_command(ser):
    length  = ord(ser.read())
    rest    = ser.read(length - 2)

    ser.dump_in()

    channel = ord(rest[0])
    name    = rest[1:]

    log.log('C', "Open channel: %d name: %s" % (channel, name))

    # OK (write file)
    result  = chr(0)
    ser.write('>' + result + '\r')
    ser.dump_out()
    return

    # directory listing
    result  = chr(3)
    ser.write('>' + result + '\r')
    ser.dump_out()
    return

def read_command(ser):
    ser.dump_in()

    data   = '\0\0\0\0'
    eof    = True
    length = chr(len(data))
    prefix = 'E' if eof else 'B'

    ser.write(prefix + length + data)
    ser.dump_out()

def read_command_with_size(ser):
    wanted = ser.read()
    ser.dump_in()

    data   = '\0\0\0\0'
    eof    = True
    length = chr(len(data))
    prefix = 'E' if eof else 'B'

    ser.write(prefix + length + data)

logs = open('rece.txt', 'a')
logs.write('\nNEW\n\n')

def write_command(ser):
    length = ser.read()
    data   = ser.read(ord(length) - 2)
    ser.dump_in()

    log.log('C', 'WROTE DATA: %r' % data) 

    logs.write(data[:-1])
    logs.write('\n')

listing = ['MANNAIA', 'ASD', 'DSA']
i = 0
def directory_info_request(ser):
    global listing
    global i

    ser.dump_in()

    if listing:
        to_send = ''
        to_send += chr(i)
        to_send += '\0'
        to_send += listing[0]
        to_send = 'L%s%s' % (chr(len(to_send)), to_send)
        ser.write(to_send)
        listing = listing[1:]
        i += 1
    else:
        ser.write('l')
        ser.dump_out()

def close_command(ser):
    ser.dump_in()
    deviceno = chr(8)
    ser.write('C' + deviceno)
    ser.dump_out()

def error_string_to_code(ser):
    pass

commands = {
    '!': register_facility_string,
    'D': debug_output,
    'S': request_file_size,
    'O': open_command,
    'R': read_command,
    'N': read_command_with_size,
    'W': write_command,
    'L': directory_info_request,
    'C': close_command,
    'E': error_string_to_code,
}

def loop(ser):
    c = ser.read()
    cmd = commands.get(c, None)

    if not cmd is None:
        #print 'calling', cmd.__name__
        cmd(ser)
    else:
        c += ser.readline()
        ser.dump_in()

        if 'nnect_ardu' in c:
            okstring = "OK>8|11|10|9|8|2:2015-14-28.23.10.10\r"
            ser.write(okstring)
            ser.dump_out()

def main():
    log = Serial()

    while True:
        loop(log)


if __name__ == '__main__':
    main() 
