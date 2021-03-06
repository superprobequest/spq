package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.util.FlxAngle;
import flixel.tile.FlxTilemap;
import flixel.system.FlxSound;
import flixel.addons.editors.ogmo.FlxOgmoLoader;

class RexPlayer extends FlxSprite
{
	private var lastY:Float;
	private var nowY:Float;

	public var speed:Float = 200;
	public var angleAttack:Float = 0;

	private var jump:FlxSound;

	public function new(X:Float = 0, Y:Float = 0)
	{
		super(X, Y);

		loadGraphic('assets/images/rtgrun/playersprite.png', true, 16, 16);
		setFacingFlip(FlxObject.LEFT, false, false);
		setFacingFlip(FlxObject.RIGHT, true, false);
		animation.add('walking', [3, 4, 3, 5], 10, false);
		animation.add('up', [6, 7, 6, 8], 6, false);
		animation.add('down', [3], 6, false);

		// drag - smaller number, more drag (slower)
		//      - larger number, less drag (faster)
		drag.x = 1000;

		// acceleration - smaller number, less resistance (higher/further)
		//              - larger number, more resistance (lower/less)
		acceleration.y = 420;

		maxVelocity.set(120, 200);
		setSize(14, 14);
		//offset.set(4, 2);

		jump = FlxG.sound.load('assets/sounds/jump.wav');
	}

	public function movement():Void
	{
		/*if (lastY != null)
			nowY = lastY;
		else
			lastY = y;
		nowY = y;*/

		acceleration.x = 0;

		/*if (onLadder == true)
		{
			if (FlxG.keys.justPressed.S && velocity.y == 0)
			{
				y += 1;
				velocity.y = 50;
				velocity.x = 0;
			}
			else if (FlxG.keys.justPressed.W && velocity.y == 0)
			{
				y -= 1;
				velocity.y = -50;
				velocity.x = 0;
			}
		}*/

		if (Registry.rexFailed != true)
			if (FlxG.keys.pressed.A)
			{
				flipX = false;
				acceleration.x -= drag.x;
			}
			else if (FlxG.keys.pressed.D)
			{
				flipX = true;
				acceleration.x += drag.x;
			}

			if (FlxG.keys.justPressed.W && velocity.y == 0 && isTouching(FlxObject.FLOOR))
			{
				y -= 1;
				velocity.y = -200;
				velocity.x = 0;
				jump.play(true);
			}

			if (velocity.x != 0)
				animation.play('walking');
			else
				animation.play('down');

			drag.x = 1000;
			acceleration.y = 420;
	}

	override public function update():Void
	{
		movement();
		super.update();
	}
}