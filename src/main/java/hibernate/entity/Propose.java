package hibernate.entity;

import lombok.*;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "propose")
public class Propose {

    @Id
    @Column(name = "idPropose")
    private int idPropose;

    @Column(name = "propose")
    private String propose;

    @Column(name = "date")
    private Date date;

    @Column(name = "idUser")
    private int idUser;

    @Column(name = "status")
    private String status;

}
