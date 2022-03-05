local present, devicons = pcall(require, "nvim-web-devicons")
if not present then
    return
end

devicons_config = {
    override = {
        py = { icon = "", color = "#FFD845", name = "Python" },
        css = { icon = "", color = "#3B7BF4", name = "CSS" },
        html = { icon = "", color = "#e34c26", name = "HTML" },
        Dockerfile = { icon = "", color = "#088DA5", name = "Dockerfile" },
        http = { icon = "", name = "http" },
        md = { icon = "", name = "markdown" }
    }
}

devicons.setup(devicons_config)

