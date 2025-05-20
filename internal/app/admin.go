package app

import (
	"github.com/lihaiya/freeaiops/pkg/admin"
)

func Admin() {
	var a App
	admin.New(a, "app", "应用")
}
