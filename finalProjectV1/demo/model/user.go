package model

import (
	"demo/dao"
	"log"

	"golang.org/x/crypto/bcrypt"
	"gorm.io/gorm"
)

type User struct {
	gorm.Model
	Username string `gorm:"not null;unique"`
	Password string `gorm:"not null"`
	Phone    string `gorm:"not null;unique"`
	Nickname string `gorm:"not null"`
	Realname string `gorm:"not null"`
}

func (u *User) Create() (err error) {
	// 加密密码
	hash, err := bcrypt.GenerateFromPassword([]byte(u.Password), bcrypt.DefaultCost)
	if err != nil {
		log.Println(err)
		return err
	}
	u.Password = string(hash) // 保存在数据库的密码
	if err := dao.DB.Create(&u).Error; err != nil {
		log.Printf("create err:%v\n", err)
		return err
	}
	return
}
func (u *User) Get() (getUser User, err error) {
	if err = dao.DB.Where(&u).Find(&getUser).Error; err != nil {
		log.Printf("err:%v\n", err)
	}
	return
}
func (u *User) Update(newPassword string) (err error) {
	hash, err := bcrypt.GenerateFromPassword([]byte(newPassword), bcrypt.DefaultCost)
	if err != nil {
		log.Println(err)
		return err
	}
	if err = dao.DB.Model(&u).Update("Password",string(hash)).Error; err != nil {
		log.Printf("update err:%v\n", err)
	}
	return
}
func (u *User) AfterCreate(tx *gorm.DB) (err error) {
	return
}
