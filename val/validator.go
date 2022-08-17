package val

import (
	"fmt"
	"net/mail"
	"regexp"
)

var (
	isValidUsername = regexp.MustCompile(`^[a-z0-9_]+$`).MatchString
	isValidFullName = regexp.MustCompile(`^[a-zA-Z\s]+$`).MatchString
)

func validateString(value string, minLength int, maxLengeth int) error {
	len := len(value)
	if len < minLength || len > maxLengeth {
		return fmt.Errorf("must contain from %d-%d characters", minLength, maxLengeth)
	}
	return nil
}

func ValidateUsername(value string) error {
	err := validateString(value, 3, 100)
	if err != nil {
		return fmt.Errorf("username: %s cannot be blank and must be between 3-100 characters", err)
	}

	if !isValidUsername(value) {
		return fmt.Errorf("username must contain letters, numbers or underscore")
	}

	return nil
}

func ValidateFullName(value string) error {
	err := validateString(value, 3, 100)
	if err != nil {
		return fmt.Errorf("fullname: %s cannot be blank and must be between 3-100 characters", err)
	}

	if !isValidFullName(value) {
		return fmt.Errorf("name must contain letters and must be between 3 and 100 characters")
	}

	return nil
}

func ValidatePassword(value string) error {
	err := validateString(value, 6, 100)
	if err != nil {
		return fmt.Errorf("password cannot be blank and must be between 6-100 characters")
	}
	return nil
}

func ValidateEmail(value string) error {
	err := validateString(value, 3, 200)
	if err != nil {
		return err
	}
	_, err = mail.ParseAddress(value)
	if err != nil {
		return fmt.Errorf("%s is not a value email address", value)
	}
	return nil
}
