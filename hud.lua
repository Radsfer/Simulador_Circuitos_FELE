local hud = {}

hud.buttons = {
	{ name = "Fonte", x = 10, y = 10, width = 100, height = 30, image = "components/fonte.png" },
	{ name = "Resistor", x = 10, y = 50, width = 100, height = 30, image = "components/resistor.png" },
	{ name = "Capacitor", x = 10, y = 90, width = 100, height = 30, image = "components/capacitor.png" },
}
hud.selected = nil -- Nenhum botão selecionado inicialmente

function hud.draw()
	for _, button in ipairs(hud.buttons) do
		-- Desenhar o fundo do botão
		if hud.selected == button.name then
			love.graphics.setColor(0.5, 0.8, 0.5) -- Botão selecionado: verde claro
		else
			love.graphics.setColor(0.8, 0.8, 0.8) -- Botão não selecionado: cinza claro
		end
		love.graphics.rectangle("fill", button.x, button.y, button.width, button.height)

		-- Desenhar o texto do botão
		love.graphics.setColor(0, 0, 0) -- Preto para o texto
		love.graphics.print(button.name, button.x + 10, button.y + 7)
	end
end

function hud.mousePressed(x, y)
	for _, button in ipairs(hud.buttons) do
		if x >= button.x and x <= button.x + button.width and y >= button.y and y <= button.y + button.height then
			hud.selected = button.name -- Atualiza o botão selecionado
			return button.image
		end
	end
end

return hud
