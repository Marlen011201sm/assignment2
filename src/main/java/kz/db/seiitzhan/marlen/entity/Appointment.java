package kz.db.seiitzhan.marlen.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.LocalTime;

@Entity
@Table(name = "APPOINTMENT")
@Data
@AllArgsConstructor
@Builder
@NoArgsConstructor
public class Appointment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "appointment_id")
    private Integer appointmentId;

    @Column(name = "appointment_date")
    @Temporal(TemporalType.DATE)
    private LocalDate appointmentDate;

    @Column(name = "appointment_time")
    @Temporal(TemporalType.TIME)
    private LocalTime appointmentTime;

    @Column(name = "work_hours")
    private Integer workHours;

    @Column(name = "status", nullable = false, length = 20)
    private String status;

    @ManyToOne
    @JoinColumn(
            name = "caregiver_user_id",
            referencedColumnName = "caregiver_user_id"
    )
    private Caregiver caregiver;

    @ManyToOne
    @JoinColumn(
            name = "member_user_id",
            referencedColumnName = "member_user_id"
    )
    private Member member;
}
