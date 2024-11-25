package dataSql

import (
	"context"

	"github.com/jackc/pgx/v5"
)

type AppUser struct {
	ID    int
	Name  string
	Email string
}

func GetAllUsers(conn *pgx.Conn) ([]AppUser, error) {
	var users []AppUser

	rows, err := conn.Query(context.Background(), "SELECT id, name, email FROM AppUser")

	if err != nil {
		return nil, err
	}
	defer rows.Close()

	for rows.Next() {
		var user AppUser
		err = rows.Scan(&user.ID, &user.Name, &user.Email)
		if err != nil {
			return nil, err
		}
		users = append(users, user)
	}

	if err := rows.Err(); err != nil {
		return nil, err
	}

	return users, err
}

func GetUser(conn *pgx.Conn, id int) (AppUser, error) {
	var user AppUser
	err := conn.QueryRow(context.Background(), "SELECT * FROM AppUser WHERE id = $1", id).Scan(&user.ID, &user.Name, &user.Email)
	return user, err
}

func InsertUser(conn *pgx.Conn, user AppUser) error {
	_, err := conn.Exec(context.Background(), "INSERT INTO AppUser (name, email) VALUES ($1, $2)", user.Name, user.Email)
	return err
}
