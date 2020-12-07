package com.website.quanlybanhang.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.website.quanlybanhang.entities.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

	@Query("select distinct u from User as u where u.userName = :userName")
	User findByUserName(@Param("userName") String userName);

	@Query("select u from User as u where u.userName != :userName")
	List<User> findAllUsersExclude(@Param("userName") String userName);

	@Query("select u from User as u inner join u.permissions p where p.permissionName = :permissionName")
	List<User> findByPermissionName(@Param("permissionName") String permissionName);

	@Query("select u from User u where u.userName like %:userName%")
	List<User> getTimKiemUser(@Param("userName") String userName);

	@Query("select u from User u where u.userName =:userName" +" and u.phoneNumber =:phoneNumber and u.email =:email")
	User findByUserNameEmailPhone(@Param("userName") String userName, @Param("phoneNumber") String phoneNumber, @Param("email") String email);
}