package hibernate.entity;

import lombok.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "users")
public class Users {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idUser")
    private int idUser;

    @Column(name = "firstName")
    private String firstName;

    @Column(name = "lastName")
    private String lastName;

    @Column(name = "email")
    private String email;

    @Column(name = "password")
    private String password;

    @Column(name = "rank")
    private int rank;

    @Column(name = "phone")
    private String phone;

    @Column(name = "cnp")
    private String cnp;

    @Column(name = "verified")
    private boolean verified;


    public Users(String firstName, String lastName, String cnp, String email, String password, int rank, String phone, boolean verified) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.cnp = cnp;
        this.email = email;
        this.password = password;
        this.rank = rank;
        this.phone = phone;
        this.verified = verified;
    }

}