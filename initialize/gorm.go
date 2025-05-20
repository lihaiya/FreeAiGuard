package initialize

import (
	"os"

	"github.com/lihaiya/freeaiops/config"
	"github.com/lihaiya/freeaiops/internal/app"
	"github.com/lihaiya/freeaiops/pkg/auth"
	"gorm.io/gorm"
)

func Gorm() *gorm.DB {
	switch config.GVA_CONFIG.DbType {
	case "mysql":
		return GormMysql()
	default:
		return GormMysql()
	}
}

// RegisterTables 注册数据库表专用
func RegisterTables(db *gorm.DB) {
	err := db.Set("gorm:table_options", "CHARSET=utf8mb4").AutoMigrate(
		// 系统模块表
		auth.BaseUser{},
		app.App{}, // app表注册
	)
	if err != nil {
		os.Exit(0)
	}
}
