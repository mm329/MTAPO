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
@Table(name = "choose")
public class Choose {

    @Id
    @Column(name = "id")
    private int id;

    @Column(name = "idUser")
    private int idUser;

    @Column(name = "theme")
    private String theme;

    @Column(name = "profName")
    private String profName;

    @Column(name = "date")
    private Date date;

}
