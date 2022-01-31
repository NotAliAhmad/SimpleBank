package db

import (
	"context"
	"log"
	"testing"
	"github.com/stretchr/testify/require"
)
func TestCreateAccount(t *testing.T){
	arg := CreateAccountParams{
		Owner: "tom",
		Balance: 100,
		Currency: "USD",
	}
	log.Println(arg)
	account, err := testQueries.CreateAccount(context.Background(),arg)
	log.Println(account)

	require.NoError(t, err)
	require.NotEmpty(t, account)

	require.Equal(t, arg.Owner, account.Owner)
	require.Equal(t, arg.Balance, account.Balance)
	require.Equal(t, arg.Currency, account.Currency)

	require.NotZero(t, account.ID)
	require.NotZero(t, account.CreatedAt)


}