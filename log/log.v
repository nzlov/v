module log

import termcolor

const (
    FATAL = 1
    ERROR = 2 
    WARN = 3
    INFO = 4
    DEBUG =5
)

struct Log{
mut:
    level int
}


pub fn (l mut Log) set_level(level int){
    l.level = level
}

interface strer{
pub:
    str() string
}

pub fn (l Log) fatal(s strer){
    panic(s.str())
}

pub fn (l Log) error(s strer){
    if l.level >= ERROR{
        f := termcolor.red('E')
        println('[$f]${s.str()}')
    }
}

pub fn (l Log) warn(s strer){
    if l.level >= WARN{
        f := termcolor.yellow('W')
        println('[$f]${s.str()}')
    }
}

pub fn (l Log) info(s strer){
    if l.level >= INFO{
        f := termcolor.white('I')
        println('[$f]${s.str()}')
    }
}

pub fn (l Log) debug(s strer){
    if l.level >= DEBUG{
        f := termcolor.blue('D')
        println('[$f]${s.str()}')
    }
}
