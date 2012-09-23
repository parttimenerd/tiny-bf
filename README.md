# tiny bf

A tiny brainf**ck implementation in ~19 lines of Ruby, with a REPL. Inspired by Fogus [uLithp blog post](http://blog.fogus.me/2012/01/25/lisp-in-40-lines-of-ruby/)

It implements a brainf**ck interpreter with a cell size of 7 bytes

See the tinybf.rb file for implementation details.

## Embedded usage

The brainf**ck interpreter is just a Ruby class that evals expressions in Ruby string arrays, like so:

```ruby
	
	echo_handler = lambda {|i| print i}
	get_handler = lambda { gets.chomp }
	 bf = Bf.new  

	 bf.eval ['[', '<', '+', '.', '>', '+', '+']
	 #
	

 !"#$%&'()*+,-./0123456789:;<=>?@
	 #=> [64, 0] 

```

## REPL usage

In your shell use Ruby 1.9.2 to run the REPL:

```sh
	ruby repl.rb
```

You'll then see a prompt:

    >
	
Start typing brain**ck code:

```
Hello World program
>+++++++++[<++++++++>-]<.>+++++++[<++++>-]<+.+++++++..+++.[-]>++++++++[<++++>-]
<.#>+++++++++++[<+++++>-]<.>++++++++[<+++>-]<.+++.------.--------.[-]>++++++++[
<++++>-]<+.[-]++++++++++.
```

When you want to leave the REPL, type ```exit```

Have some fun...
