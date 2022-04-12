package com.apiprojetoss.projetoss.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserDetailsService implements org.springframework.security.core.userdetails.UserDetailsService {

    @Autowired
    private PasswordEncoder encoder;
    
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        if(!username.equals("recrutamento")) {
            throw new UsernameNotFoundException("Usuario não encontrado!");
        }

        return User
                .builder()
                .username("recrutamento")
                .password(encoder.encode("recrutamento"))
                .roles("USER", "ADMIN")
                .build();
    }
}
