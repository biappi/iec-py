import serial

def print_data(s):
    return ' '.join((hex(ord(i))[2:] for i in s))

class Serial(serial.Serial):
    def __init__(self):
        serial.Serial.__init__(
            self,
            '/dev/cu.usbmodem1a1241',
            115200,
        )

    def write(self, s):
        print 'SER >   -', print_data(s)
        serial.Serial.write(self, s)

    def read(self, howmuch=None):
        if howmuch is None:
            c = serial.Serial.read(self)
            print 'SER <   -', c, ord(c), hex(ord(c))
            return c
        else:
            x = serial.Serial.read(self, howmuch)
            print 'SER <   -', x
            return x

    def readline(self):
        incoming = ''

        while not incoming.endswith('\r'):
            incoming += serial.Serial.read(self)

        print 'SER <   -', incoming
        return incoming

okstring = "OK>8|11|10|9|8|2:2015-14-28.23.10.10\r"

def connect(ser):
    incoming = ''

    while not incoming.endswith('\r'):
        incoming += ser.read()
        if incoming == "connect_arduino:2\r":
            ser.write(okstring)

log_facilities = {}

def register_facility_string(ser):
    line = ser.readline()
    log_facilities[line[0]] = line[1:-1]

debug_level = {
    'S': 'SUCCESS',
    'I': 'INFO   ',
    'W': 'WARNING',
    'E': 'ERROR  ',
}

def debug_output(ser):
    line  = ser.readline()
    level = line[0]
    facil = line[1]
    mesg  = line[2:]
    print debug_level[level], '-', log_facilities[facil], '-', mesg

def request_file_size(ser):
    filesize = 0
    hi = chr((filesize >> 8) | 0xff)
    lo = chr((filesize >> 0) | 0xff)
    ser.write('S' + hi + lo)

def open_command(ser):
    length  = ord(ser.read())
    rest    = ser.read(length - 2)
    channel = rest[0]
    print "chan", channel, ord(channel)
    print 'OPEN', rest[1:]

    # OK (write file)
    result  = chr(0)
    ser.write('>' + result + '\r')
    return

    # directory listing
    result  = chr(3)
    ser.write('>' + result + '\r')
    return

def read_command(ser):
    data   = '\0\0\0\0'
    eof    = True
    length = chr(len(data))
    prefix = 'E' if eof else 'B'

    ser.write(prefix + length + data)

def read_command_with_size(ser):
    wanted = ser.read()
    print 'READ', wanted

    data   = '\0\0\0\0'
    eof    = True
    length = chr(len(data))
    prefix = 'E' if eof else 'B'

    ser.write(prefix + length + data)

def write_command(ser):
    length = ser.read()
    data   = ser.read(ord(length) - 2)

    print 'WRITE', print_data(data)
    print 'WRITE', data
    print '-'



listing = ['MANNAIA', 'ASD', 'DSA']
i = 0
def directory_info_request(ser):
    global listing
    global i

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

def close_command(ser):
    deviceno = chr(8)
    ser.write('C' + deviceno)

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
        print 'calling', cmd.__name__
        cmd(ser)
    else:
        c += ser.readline()
        print 'got line:', c
        if 'nnect_ardu' in c:
            ser.write(okstring)

def main():
    log = Serial()

    while True:
        loop(log)


if __name__ == '__main__':
    main() 
