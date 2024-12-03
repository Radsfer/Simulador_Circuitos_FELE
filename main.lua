-- Carregar o módulo do canvas
local canvas = require("canvas")
local hud = require("hud")
local components = require("components")

local currentObject = nil -- Objeto que está sendo posicionado
local objects = {} -- Lista de objetos fixos no canvas
local selectedObject = nil -- Objeto atualmente selecionado

local IMAGE_SIZE = 100 -- Tamanho padrão das imagens

function love.load()
	love.graphics.setBackgroundColor(1, 1, 1) -- Fundo branco
	GridSize = 20 -- Tamanho do grid
end

function love.draw()
	-- Chamar a função do canvas para desenhar o grid
	canvas.drawGrid(GridSize)

	-- Chamar a HUD
	hud.draw()

	-- Resetar a cor para branco antes de desenhar objetos ou imagens
	love.graphics.setColor(1, 1, 1)
	-- Desenha o componente
	components.draw(objects, currentObject)
	-- Caso você precise alterar novamente a cor no futuro, é recomendável resetar ao final
	love.graphics.setColor(1, 1, 1)
end

function love.mousepressed(x, y, button, istouch, presses)
	if button == 1 then -- Clique esquerdo
		-- Verificar se clicou na HUD
		local selectedImagePath = hud.mousePressed(x, y)
		if selectedImagePath then
			-- Criar um novo objeto na posição à direita do botão clicado
			currentObject = {
				image = love.graphics.newImage(selectedImagePath),
				x = 120, -- Lado direito dos botões
				y = 10 + (#objects * (IMAGE_SIZE + 10)), -- Incrementar posição vertical
			}
		elseif currentObject then
			-- Fixar o objeto no canvas
			table.insert(objects, currentObject)
			currentObject = nil
		else
			-- Selecionar um objeto existente
			for _, obj in ipairs(objects) do
				if x >= obj.x and x <= obj.x + IMAGE_SIZE and y >= obj.y and y <= obj.y + IMAGE_SIZE then
					selectedObject = obj
					return
				end
			end
			-- Caso clique fora de objetos, deselecionar
			selectedObject = nil
		end
	end
end

function love.mousemoved(x, y, dx, dy, istouch)
	-- Mover o objeto atualmente sendo criado com o mouse
	if currentObject then
		currentObject.x = x
		currentObject.y = y
	end

	-- Arrastar o objeto selecionado
	if selectedObject and love.mouse.isDown(1) then
		selectedObject.x = selectedObject.x + dx
		selectedObject.y = selectedObject.y + dy
	end
end

