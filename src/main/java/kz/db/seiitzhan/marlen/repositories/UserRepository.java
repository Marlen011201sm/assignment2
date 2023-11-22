package kz.db.seiitzhan.marlen.repositories;

import kz.db.seiitzhan.marlen.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
}
