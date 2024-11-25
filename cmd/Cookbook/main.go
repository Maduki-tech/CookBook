package main

import (
	"context"
	"fmt"
	"os"

	dataSql "github.com/Maduki-tech/CookBook/db/data"
	"github.com/jackc/pgx/v5"
	"github.com/joho/godotenv"
)

func main() {
	err := godotenv.Load(".env")

	if err != nil {
		fmt.Fprintf(os.Stderr, "Error loading .env file")
		os.Exit(1)
	}

	conn, err := pgx.Connect(context.Background(), os.Getenv("DATABASE_URL"))
	if err != nil {
		fmt.Fprintf(os.Stderr, "Unable to connect to database: %v\n", err)
	}

	defer conn.Close(context.Background())

	result, err := dataSql.GetAllUsers(conn)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Error getting all users: %v\n", err)
		os.Exit(1)
	}

	for _, user := range result {
		fmt.Printf("User: %s\n", user.Name)
	}

}
