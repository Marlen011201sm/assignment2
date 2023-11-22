package kz.db.seiitzhan.marlen.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "MEMBER")
@Data
@AllArgsConstructor
@Builder
@NoArgsConstructor
public class Member {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "member_user_id")
    private Integer memberUserId;

    @Column(name = "house_rules", columnDefinition = "TEXT")
    private String houseRules;

    @OneToOne
    @JoinColumn(
            name = "user_id",
            referencedColumnName = "user_id",
            nullable = false
    )
    private User user;
}