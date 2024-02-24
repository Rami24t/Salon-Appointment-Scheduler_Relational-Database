psql --username=freecodecamp --dbname=salon <<EOF
 -- Insert data into services table
 INSERT INTO services (name) VALUES 
    ('cut'),
    ('color'),
    ('perm'),
    ('style'),
    ('trim')
    
EOF
