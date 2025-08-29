# emoji-list

macOS command line tool to list directory contents using emoji

## What it does

This is a fun tool that I put together because I needed it. (No, really!) I thought it might be fun for others, too.

`emoji-list` will list the contents of a directory in the shell, but use emojis such as 📁 and 📄 to look a bit like a Finder window in list mode.

The nice thing is that you can copy the output and paste in to documentation. For example, the output of `emoji-list` on its own project repository looks like this is:

```
📄 LICENSE
📄 Package.resolved
📄 Package.swift
🚀 pkgAndNotarize.sh
📄 ReadMe.md
📁 Sources
   📄 emoji_list.swift
   📄 FileEmoji.swift
   📄 URL-Extensions.swift
```

## Options

There are only a few options.

```
  -a, --all               include hidden items
  -b, --bundles           list contents of bundles and packages
  --no-recursion          disable recursive listing of directories
  -r, --reverse-sort      reverse the order of the sort
```

You can also get this information from the `--help` or man page.
