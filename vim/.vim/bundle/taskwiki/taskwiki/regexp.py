import re

# Unnamed building blocks
UUID_UNNAMED = r'[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}'
UUID_UNNAMED_SHORT = r'[0-9a-fA-F]{8}'
DUE_UNNAMED = r'\(\d{4}-\d\d-\d\d( \d\d:\d\d)?\)'
SPACE_UNNAMED = r'\s*'
NONEMPTY_SPACE_UNNAMED = r'\s+'
FINAL_SEGMENT_SEPARATOR_UNNAMED = r'(\s+|$)'
SOURCE_INDICATOR = r'(?P<source>[A-Z]):'

# Building blocks
BRACKET_OPENING = re.escape('* [')
BRACKET_CLOSING = re.escape('] ')
EMPTY_SPACE = r'(?P<space>\s*)'
UUID = r'(?P<uuid>{0}|{1})'.format(UUID_UNNAMED, UUID_UNNAMED_SHORT)
DUE = r'(?P<due>{0})'.format(DUE_UNNAMED)
TEXT = r'(?P<text>.+?)'
COMPLETION_MARK = r'(?P<completed>.)'
PRIORITY = r'(?P<priority>!{1,3})'

GENERIC_TASK = re.compile(''.join([
    '^',
    EMPTY_SPACE,
    BRACKET_OPENING,
    COMPLETION_MARK,
    BRACKET_CLOSING,
    TEXT,
    FINAL_SEGMENT_SEPARATOR_UNNAMED,
    '(', PRIORITY, FINAL_SEGMENT_SEPARATOR_UNNAMED, ')?',
    '(', DUE, FINAL_SEGMENT_SEPARATOR_UNNAMED, ')?',
    '(',
        '#',
        '(', SOURCE_INDICATOR, ')?',
        '(', UUID, ')?',
    ')?',  # UUID is not there for new tasks
    SPACE_UNNAMED,
    '$'    # Enforce match on the whole line
]))

DATETIME_FORMAT = "(%Y-%m-%d %H:%M)"
DATE_FORMAT = "(%Y-%m-%d)"

GENERIC_VIEWPORT = re.compile(
    '^'                          # Starts at the begging of the line
    '[=]+'                       # Heading begging
    '(?P<name>[^=\|\[\{]*)'      # Name of the viewport, all before the | sign
                                 # Cannot include '[', '=', '|, and '{'
    '\|'                         # Colon
    '(?P<filter>[^=\|]+?)'       # Filter
    '('                          # Optional defaults
      '\|'                       # Colon
      '(?P<defaults>[^=\|]+?)'   # Default attrs
    ')?'
    '\s*'                        # Any whitespace
    '(#(?P<source>[A-Z]))?'      # Optional source indicator
    '\s*'                        # Any whitespace
    '(\$(?P<sort>[A-Z]))?'       # Optional sort indicator
    '\s*'                        # Any whitespace
    '[=]+'                       # Header ending
    )

GENERIC_HEADER = re.compile(
    '^'        # Starts at the beginning of the line
    '[=]+'     # With a positive number of =
    '[^=]+'    # Character other than =
    '[=]+'     # Positive number of =, closing the header
    '\s*'      # Allow trailing whitespace
)

ANSI_ESCAPE_SEQ = re.compile(
    '\x1b'     # literal ESC
    '\['       # literal [
    '[;\d]*'   # zero or more digits or semicolons
    '[A-Za-z]' # a letter
    )
