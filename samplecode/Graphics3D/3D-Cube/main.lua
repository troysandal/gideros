local function face(color,rx,ry)
	-- Create a colored face
	c=Sprite.new()
	s=Shape.new()
	s:setFillStyle(Shape.SOLID, color,0.8)
	s:beginPath()
	s:moveTo(-1,-1)
	s:lineTo(-1,1)
	s:lineTo(1,1)
	s:lineTo(1,-1)
	s:lineTo(-1,-1)
	s:endPath()

	s:setZ(-1)
	c:addChild(s)
	c:setRotationX(rx)
	c:setRotationY(ry)
	return c;
end

--Create a cube
cube=Mesh.new(true)
cube:addChild(face(0xFF0000,0,0))
cube:addChild(face(0xFFFF00,90,0))
cube:addChild(face(0xFF00FF,-90,0))
cube:addChild(face(0x00FF00,180,0))
cube:addChild(face(0x00FFFF,0,90))
cube:addChild(face(0x0000FF,0,-90))

--Set up the 3D view and projection
local sw,sh=application:getContentWidth(),application:getContentHeight()
local projection=Matrix.new()
projection:perspectiveProjection(45,sw/sh,0.1,1000)
local view=Viewport.new()
view:setProjection(projection)
view:setPosition(sw/2,sh/2)
view:setScale(-sw/2,-sh/2,1)
stage:addChild(view)

--Add our cube to the scene
view:setContent(cube)
--Look at it from -8 units in Z direction
view:lookAt(0,0,-8,0,0,0,0,1,0)

--Rotate our cube
cube:addEventListener(Event.ENTER_FRAME,function ()
	cube:setRotationX(cube:getRotationX()+1)
	cube:setRotationY(cube:getRotationY()+1.2)
	cube:setRotation(cube:getRotation()+1.3)
end)

