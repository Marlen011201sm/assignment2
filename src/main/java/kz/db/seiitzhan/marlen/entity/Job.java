package kz.db.seiitzhan.marlen.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Entity
@Table(name = "JOB")
@Data
@AllArgsConstructor
@Builder
@NoArgsConstructor
public class Job {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "job_id")
    private Integer jobId;

    @Column(name = "required_caregiving_type", nullable = false, length = 40)
    private String requiredCaregivingType;

    @Column(name = "other_requirements", columnDefinition = "TEXT")
    private String otherRequirements;

    @Column(name = "date_posted")
    @Temporal(TemporalType.DATE)
    private LocalDate datePosted;

    @ManyToOne
    @JoinColumn(
            name = "member_user_id",
            referencedColumnName = "member_user_id"
    )
    private Member member;
}
