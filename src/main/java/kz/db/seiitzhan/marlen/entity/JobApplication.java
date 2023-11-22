package kz.db.seiitzhan.marlen.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Entity
@Table(name = "JOB_APPLICATION")
@Data
@AllArgsConstructor
@Builder
@NoArgsConstructor
public class JobApplication {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "job_application_id")
    private Integer jobApplicationId;

    @Column(name = "date_applied")
    @Temporal(TemporalType.DATE)
    private LocalDate dateApplied;

    @ManyToOne
    @JoinColumn(
            name = "job_id",
            referencedColumnName = "job_id"
    )
    private Job job;

    @ManyToOne
    @JoinColumn(
            name = "caregiver_user_id",
            referencedColumnName = "caregiver_user_id"
    )
    private Caregiver caregiver;
}
