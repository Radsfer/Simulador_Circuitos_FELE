-- component.lua
local component = {}

local IMAGE_SIZE = 100 -- Tamanho padrão das imagens

-- Função para criar um novo objeto
function component.createObject(type, x, y)
	local obj = {
		type = type,
		x = x,
		y = y,
		properties = {},
	}

	if type == "source" then
		obj.image = love.graphics.newImage("components/source.png")
		obj.properties.voltage = 5 -- Valor inicial de tensão
	elseif type == "resistor" then
		obj.image = love.graphics.newImage("components/resistor.png")
		obj.properties.resistance = 10 -- Valor inicial de resistência
	elseif type == "capacitor" then
		obj.image = love.graphics.newImage("components/capacitor.png")
		obj.properties.capacitance = 1 -- Valor inicial de capacitância
	end

	return obj
end

-- Função para desenhar o objeto
function component.draw(objects, currentObject)
	-- Desenhar o objeto em criação
	if currentObject then
		love.graphics.draw(
			currentObject.image,
			currentObject.x,
			currentObject.y,
			0,
			IMAGE_SIZE / currentObject.image:getWidth(),
			IMAGE_SIZE / currentObject.image:getHeight()
		)
	end

	-- Desenhar todos os objetos fixos
	for _, obj in ipairs(objects) do
		love.graphics.draw(
			obj.image,
			obj.x,
			obj.y,
			0,
			IMAGE_SIZE / obj.image:getWidth(),
			IMAGE_SIZE / obj.image:getHeight()
		)
	end
end

return component
