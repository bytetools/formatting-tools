# formatting-tools

This is very... miscellaneous repo.
Basically, random one-off scripts that do something small enough that it doesn't make sense to create an entirely different repository for it.

All tools are explained by a second level header.

## `replace-bad-characters`

This script removes common bad characters from the `pdftotext` tool.
It does *not* catch them all though.

### Usage

```bash
$ replace-bad-characters test.txt
```

## `format-paragraph.vim`

This vim script defines a function that will (mostly) format sentences on one line.
It screws up on colons and and question marks if text is after it, but otherwise is fairly accurate.
