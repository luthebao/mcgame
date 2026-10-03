// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.MazePlayRulePanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.Text;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import com.qeedoo.game.config.Language;
    import mx.binding.Binding;
    import mx.events.FlexEvent;
    import flash.utils.getDefinitionByName;
    import flash.events.*;
    import flash.display.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.text.*;
    import flash.media.*;
    import mx.binding.*;
    import flash.net.*;
    import flash.utils.*;
    import flash.system.*;
    import flash.accessibility.*;
    import flash.ui.*;
    import flash.filters.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    use namespace mx_internal;

    public class MazePlayRulePanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public var _MazePlayRulePanel_BasicTitleCanvas1:BasicTitleCanvas;
        public var _MazePlayRulePanel_Text1:Text;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":450,
                    "height":400,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"_MazePlayRulePanel_BasicTitleCanvas1"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.left = "10";
                            this.top = "55";
                            this.right = "10";
                            this.bottom = "20";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "styleName":"CanvasBorder",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_MazePlayRulePanel_Text1",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "10";
                                        this.top = "10";
                                        this.right = "10";
                                        this.bottom = "10";
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":410,
                                            "height":305,
                                            "selectable":false
                                        });
                                    }
                                })]
                            });
                        }
                    })]
                });
            }
        });
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function MazePlayRulePanel()
        {
            mx_internal::_document = this;
            this.width = 450;
            this.height = 400;
            this.styleName = "StandardContent";
            this.cacheAsBitmap = true;
            this.addEventListener("creationComplete", ___MazePlayRulePanel_DragableCanvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            MazePlayRulePanel._watcherSetupUtil = _arg_1;
        }


        private function _MazePlayRulePanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.MAZE_PLAY_RULE_PANEL_U[0];
            _local_1 = Language.MAZE_PLAY_RULE_PANEL_U[1];
        }

        public function showPanel():void
        {
            this.visible = true;
        }

        private function _MazePlayRulePanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_PLAY_RULE_PANEL_U[0];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazePlayRulePanel_BasicTitleCanvas1.text = _arg_1;
            }, "_MazePlayRulePanel_BasicTitleCanvas1.text");
            result[0] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.MAZE_PLAY_RULE_PANEL_U[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _MazePlayRulePanel_Text1.text = _arg_1;
            }, "_MazePlayRulePanel_Text1.text");
            result[1] = binding;
            return (result);
        }

        public function ___MazePlayRulePanel_DragableCanvas1_creationComplete(_arg_1:FlexEvent):void
        {
            initView();
        }

        override public function initialize():void
        {
            var target:MazePlayRulePanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _MazePlayRulePanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_MazePlayRulePanelWatcherSetupUtil");
                var _local_2:* = watcherSetupUtilClass;
                (_local_2["init"](null));
            };
            _watcherSetupUtil.setup(this, function (_arg_1:String):*
            {
                return (target[_arg_1]);
            }, bindings, watchers);
            var i:uint;
            while (i < bindings.length)
            {
                Binding(bindings[i]).execute();
                i++;
            };
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            super.initialize();
        }

        override public function initView():void
        {
        }


    }
}//package com.qeedoo.ui.view.compDragable

