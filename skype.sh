sqlite3 -batch "$HOME/Library/Application Support/Skype/$1/main.db" <<EOF
.mode csv
.output $2.csv
select author, datetime(timestamp, 'unixepoch', 'localtime'), edited_timestamp, body_xml from Messages where dialog_partner = '$2';
.output stdout
.exit
EOF