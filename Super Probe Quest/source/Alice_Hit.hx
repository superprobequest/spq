package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.util.FlxAngle;
import flixel.tile.FlxTilemap;
import flixel.addons.editors.ogmo.FlxOgmoLoader;

class Alice_Hit extends FlxSprite
{
	public function new(X:Float=0, Y:Float=0) 
	{
	    super(X, Y);
	    loadGraphic('assets/images/alicemaze/alice_hit.png', false, 16, 16);
	}

	override public function update():Void
	{
		super.update();
	}
}