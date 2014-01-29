#config_parser

Simple file config parser.

## Usage

Using this config parser is rather trivial and you can use it in two ways:

### Command line

You can run the config parser via the command line:

```
$ ./bin/parser path-to-config-file
```

### Ruby library

Just require the library and use it in your code:

```
$ irb -I lib
> require 'config_parser'
> parser = ConfigParser.new(File.read('path-to-config-file'))
```

You can then access the keys of your config files via dot notation or via the config hash:

```
> parser.verbose
=> true 
> parser.config['verbose']
=> true 
```
