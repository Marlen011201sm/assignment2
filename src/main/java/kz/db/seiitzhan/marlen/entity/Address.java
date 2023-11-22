package kz.db.seiitzhan.marlen.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "ADDRESS")
@Data
@AllArgsConstructor
@Builder
@NoArgsConstructor
public class Address {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "address_id")
    private Integer addressId;

    @Column(name = "house_number", length = 100)
    private String houseNumber;

    @Column(length = 80)
    private String street;

    @Column(name = "town", length = 80)
    private String town;

    @ManyToOne
    @JoinColumn(
            name = "member_user_id",
            referencedColumnName = "member_user_id",
            nullable = false
    )
    private Member member;
}
