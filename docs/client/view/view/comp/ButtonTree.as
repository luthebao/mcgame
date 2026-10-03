// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.ButtonTree

package com.qeedoo.ui.view.comp
{
    import mx.controls.Tree;
    import mx.core.ClassFactory;
    import flash.events.MouseEvent;
    import mx.controls.listClasses.IListItemRenderer;
    import flash.display.Sprite;

    public class ButtonTree extends Tree 
    {

        public var buttonStyleName:String = "BtnAchievement";

        public function ButtonTree()
        {
            itemRenderer = new ClassFactory(ButtonTreeItemRenderer);
            styleName = "ButtonTree";
        }

        override protected function mouseOverHandler(_arg_1:MouseEvent):void
        {
        }

        override protected function drawItem(_arg_1:IListItemRenderer, _arg_2:Boolean=false, _arg_3:Boolean=false, _arg_4:Boolean=false, _arg_5:Boolean=false):void
        {
            super.drawItem(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5);
            if (_arg_2)
            {
                ButtonTreeItemRenderer(_arg_1).btn.selected = true;
            }
            else
            {
                if (!_arg_2)
                {
                    ButtonTreeItemRenderer(_arg_1).btn.selected = false;
                };
            };
        }

        override protected function drawSelectionIndicator(_arg_1:Sprite, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:uint, _arg_7:IListItemRenderer):void
        {
            _arg_1.x = _arg_2;
            _arg_1.y = _arg_3;
        }


    }
}//package com.qeedoo.ui.view.comp

import mx.controls.treeClasses.TreeItemRenderer;
import com.qeedoo.ui.view.comp.RoundedButton;
import mx.controls.treeClasses.TreeListData;
import com.qeedoo.ui.view.comp.ButtonTree;

class ButtonTreeItemRenderer extends TreeItemRenderer 
{

    public var btn:RoundedButton;


    override protected function createChildren():void
    {
        super.createChildren();
        btn = new RoundedButton();
        addChild(btn);
    }

    override protected function updateDisplayList(_arg_1:Number, _arg_2:Number):void
    {
        var _local_3:TreeListData;
        super.updateDisplayList(_arg_1, _arg_2);
        if (super.data)
        {
            _local_3 = TreeListData(super.listData);
            if (((_local_3.hasChildren) || (_local_3.depth == 1)))
            {
                this.btn.x = 0;
                this.btn.height = (super.label.height + 4);
                this.btn.width = super.label.width;
            }
            else
            {
                this.btn.x = 24;
                this.btn.height = (super.label.height + 4);
                this.btn.width = (super.label.width - 19);
            };
            this.btn.styleName = ButtonTree(owner).buttonStyleName;
            this.btn.label = _local_3.label;
            this.btn.y = super.label.y;
            super.label.visible = false;
        };
    }


}


