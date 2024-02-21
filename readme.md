## GitRekt

This is a simple extraction of the libgit2 wrapper library from https://github.com/redrabbit/git.limo, with some fixed headers and updated Makefile for modern MacOS and Linux.

## Usage

Ensure you have libgit2 installed on your system. On MacOS, you can install it with Homebrew:

```bash
brew install libgit2
```

Then put this in your mixfile:

```elixir
  {:gitrekt, git: "https://github.com/jtippett/gitrekt.git", branch: "main"}
```
     
Then run `mix deps.get` and you're good to go.


