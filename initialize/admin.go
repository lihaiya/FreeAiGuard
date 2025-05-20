package initialize

import (
	"github.com/gin-gonic/gin"
	"github.com/lihaiya/freeaiops/config"
	"github.com/lihaiya/freeaiops/internal/app"
	"github.com/lihaiya/freeaiops/pkg/admin"
)

func Admin(r *gin.Engine) {
	if !config.GVA_CONFIG.Admin.Enable {
		return
	}
	admin.Init(r, nil)
	app.Admin()
}
