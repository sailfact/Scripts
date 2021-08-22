#!/usr/bin/python3 
      
import hashlib 
import string
import itertools

      
#hidden password hash 
      
passwordHash = "2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824" 
      
for i in itertools.product(string.ascii_letters+string.digits, repeat=5):
    word = ''.join(i)
    #hash the word 
    hash = hashlib.sha256(word.encode("utf-8")).hexdigest() 
    #if the hash is the same as the correct password's hash then we have cracked the password!
    if(hash == passwordHash):
        print("Password has been cracked! It was {}".format(word))
        exit((0))

    
    