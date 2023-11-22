package kz.db.seiitzhan.marlen.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Entity
@Table(name = "CAREGIVER")
@Data
@AllArgsConstructor
@Builder
@NoArgsConstructor
public class Caregiver {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "caregiver_user_id")
    private Integer caregiverUserId;

    @Lob
    @Column
    private byte[] photo;

    @Column(name = "gender")
    private String gender;

    @Column(name = "caregiving_type", nullable = false)
    private String caregivingType;

    @Column(name = "hourly_rate", precision = 6, scale = 3, nullable = false)
    private BigDecimal hourlyRate;

    @OneToOne
    @JoinColumn(
            name = "user_id",
            referencedColumnName = "user_id",
            nullable = false
    )
    private User user;
}
