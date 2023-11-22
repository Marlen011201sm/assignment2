package kz.db.seiitzhan.marlen.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "USERS")
@Data
@AllArgsConstructor
@Builder
@NoArgsConstructor
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private Integer userId;

    @Column(nullable = false, length = 80)
    private String email;

    @Column(name = "given_name", nullable = false, length = 30)
    private String givenName;

    @Column(name = "surname", nullable = false, length = 30)
    private String surname;

    @Column(length = 50)
    private String city;

    @Column(name = "phone_number", length = 12)
    private String phoneNumber;

    @Column(name = "profile_description", columnDefinition = "TEXT")
    private String profileDescription;

    @Column(name = "password", nullable = false, length = 80)
    private String password;
}