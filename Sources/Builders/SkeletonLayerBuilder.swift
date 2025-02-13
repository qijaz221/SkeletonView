// Copyright © 2018 SkeletonView. All rights reserved.

import UIKit

/// Object that facilitates the creation of skeleton layers,
/// based on the builder pattern
class SkeletonLayerBuilder {
    var skeletonType: SkeletonType?
    var colors: [UIColor] = []
    var holder: UIView?
    var cornerRadius: Int?

    func setSkeletonType(_ type: SkeletonType) -> SkeletonLayerBuilder {
        self.skeletonType = type
        return self
    }

    func addColor(_ color: UIColor) -> SkeletonLayerBuilder {
        return addColors([color])
    }

    func addColors(_ colors: [UIColor]) -> SkeletonLayerBuilder {
        self.colors.append(contentsOf: colors)
        return self
    }

    func setHolder(_ holder: UIView) -> SkeletonLayerBuilder {
        self.holder = holder
        return self
	}
    
    
    func setCornerRadius(_ radius: Int) -> SkeletonLayerBuilder {
        self.cornerRadius = radius
        return self
    }
    
	
	func build() -> SkeletonLayer? {
		guard let type = skeletonType,
			let holder = holder
			else { return nil }
		
		let layer =  SkeletonLayer(type: type,
							 colors: colors,
							 skeletonHolder: holder)
        return layer
	}
}
