// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compFore.ClassHeadCanvas

package com.qeedoo.ui.view.compFore
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import com.qeedoo.game.vo.ClassVO;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import com.qeedoo.ui.resource.ResManager;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import flash.events.MouseEvent;
    import com.qeedoo.game.system.Core;
    import com.qeedoo.game.view.ViewManager;
    import com.qeedoo.game.predef.GamePredef;
    import flash.events.Event;
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

    public class ClassHeadCanvas extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _CSelect:Object;
        private var _857278251maleIconImage:Image;
        private var _853620273classVO:ClassVO;
        private var _1227629962femaleIconImage:Image;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({"childDescriptors":[new UIComponentDescriptor({
                        "type":Image,
                        "id":"maleIconImage",
                        "events":{"click":"__maleIconImage_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":0,
                                "width":50,
                                "height":50,
                                "useHandCursor":true,
                                "scaleContent":false
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"femaleIconImage",
                        "events":{"click":"__femaleIconImage_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "y":0,
                                "width":50,
                                "height":50,
                                "useHandCursor":true,
                                "x":58,
                                "scaleContent":false
                            });
                        }
                    })]});
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function ClassHeadCanvas()
        {
            mx_internal::_document = this;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            ClassHeadCanvas._watcherSetupUtil = _arg_1;
        }


        public function set classData(_arg_1:ClassVO):void
        {
            var _local_2:Array;
            classVO = _arg_1;
            if (classVO.classDescription)
            {
                _local_2 = classVO.classDescription.split("|");
                this.toolTip = ((_local_2[0] + "\n") + _local_2[1]);
            };
        }

        private function _ClassHeadCanvas_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = ResManager.getIconUrl(classVO.iconCodeMale);
            _local_1 = ResManager.getIconUrl(classVO.iconCodeFemale);
        }

        public function set femaleIconImage(_arg_1:Image):void
        {
            var _local_2:Object = this._1227629962femaleIconImage;
            if (_local_2 !== _arg_1)
            {
                this._1227629962femaleIconImage = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "femaleIconImage", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:ClassHeadCanvas;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _ClassHeadCanvas_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compFore_ClassHeadCanvasWatcherSetupUtil");
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

        [Bindable(event="propertyChange")]
        public function get maleIconImage():Image
        {
            return (this._857278251maleIconImage);
        }

        public function __femaleIconImage_click(_arg_1:MouseEvent):void
        {
            chooseIcon(_arg_1);
        }

        private function _ClassHeadCanvas_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(classVO.iconCodeMale));
            }, function (_arg_1:Object):void
            {
                maleIconImage.source = _arg_1;
            }, "maleIconImage.source");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(classVO.iconCodeFemale));
            }, function (_arg_1:Object):void
            {
                femaleIconImage.source = _arg_1;
            }, "femaleIconImage.source");
            result[1] = binding;
            return (result);
        }

        private function set classVO(_arg_1:ClassVO):void
        {
            var _local_2:Object = this._853620273classVO;
            if (_local_2 !== _arg_1)
            {
                this._853620273classVO = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "classVO", _local_2, _arg_1));
            };
        }

        public function set maleIconImage(_arg_1:Image):void
        {
            var _local_2:Object = this._857278251maleIconImage;
            if (_local_2 !== _arg_1)
            {
                this._857278251maleIconImage = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "maleIconImage", _local_2, _arg_1));
            };
        }

        private function chooseIcon(_arg_1:Event):void
        {
            if (_CSelect == null)
            {
                _CSelect = Core.getInstance().view.getUI(ViewManager.FORE_C_C);
            };
            var _local_2:uint = 1;
            while (_local_2 <= 6)
            {
                _CSelect[("chc" + _local_2)].maleIconImage.filters = [];
                _CSelect[("chc" + _local_2)].femaleIconImage.filters = [];
                _local_2++;
            };
            _arg_1.currentTarget.filters = [GamePredef.FILTER_CHAR_SELECTED_2];
            var _local_3:Object = {};
            _local_3.gender = _arg_1.currentTarget.id;
            _local_3.classData = classVO;
            _CSelect.changeResAndDes(_local_3);
        }

        [Bindable(event="propertyChange")]
        private function get classVO():ClassVO
        {
            return (this._853620273classVO);
        }

        [Bindable(event="propertyChange")]
        public function get femaleIconImage():Image
        {
            return (this._1227629962femaleIconImage);
        }

        public function __maleIconImage_click(_arg_1:MouseEvent):void
        {
            chooseIcon(_arg_1);
        }


    }
}//package com.qeedoo.ui.view.compFore

