local canvas = {}

function canvas.drawGrid(gridSize)
	love.graphics.setColor(0.8, 0.8, 0.8) -- Cor do grid
	local width, height = love.graphics.getDimensions()

	-- Linhas verticais
	for x = 0, width, gridSize do
		love.graphics.line(x, 0, x, height)
	end

	-- Linhas horizontais
	for y = 0, height, gridSize do
		love.graphics.line(0, y, width, y)
	end
end

return canvas
