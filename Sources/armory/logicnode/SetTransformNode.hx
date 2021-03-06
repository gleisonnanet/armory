package armory.logicnode;

import armory.object.Object;
import armory.math.Mat4;
#if arm_physics
import armory.trait.internal.RigidBody;
#end

class SetTransformNode extends LogicNode {

	public function new(tree:LogicTree) {
		super(tree);
	}

	override function run() {
		var object:Object = inputs[1].get();
		var matrix:Mat4 = inputs[2].get();

		if (object == null) object = tree.object;

		object.transform.setMatrix(matrix);

		#if arm_physics
		var rigidBody = object.getTrait(RigidBody);
		if (rigidBody != null) rigidBody.syncTransform();
		#end

		super.run();
	}
}
