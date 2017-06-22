Phonelib.default_country = "US"

Phonelib.parse_special = true
# allows us to parse special numbres (short codes, emergency, etc. )

# Phonelib.vanity_conversion = true
# allows phonelib to convert characters passed in phone numbers to their numeric representation ea: 800-CALL-NOW -> 800-225-5669

Phonelib.extension_separate_symbols = 'x;'
# holds symbols that are used for separating extensions from phone number - used for parsing

# Phonelib.override_phone_data = '/path/to/override_phone_data.dat'
# allows us to overwrite some of Google's libphonenumber library data, need to assign a file path to the new setter
