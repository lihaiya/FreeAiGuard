package app

import (
	"github.com/gin-gonic/gin"
	"github.com/lihaiya/freeaiops/pkg/router"
)

func InitRouter(g *gin.RouterGroup) {
	r := router.NewRouter(g.Group("app"))
	a := NewApi()
	r.BindApi("", a)
	r.BindGet("hello", a.Hello) //
}
