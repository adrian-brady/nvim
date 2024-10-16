local registries = {
	"github:nvim-java/mason-registry",
	"github:mason-org/mason-registry",
}

require("mason").setup({
	registries = registries,
})
