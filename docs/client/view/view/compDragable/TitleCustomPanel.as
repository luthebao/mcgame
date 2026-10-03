// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.compDragable.TitleCustomPanel

package com.qeedoo.ui.view.compDragable
{
    import com.qeedoo.ui.view.comp.DragableCanvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.ComboBox;
    import mx.controls.Button;
    import mx.controls.Label;
    import com.qeedoo.ui.view.comp.BasicTitleCanvas;
    import mx.controls.Alert;
    import mx.core.UIComponentDescriptor;
    import mx.containers.Canvas;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import flash.events.MouseEvent;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.game.predef.GamePredef;
    import flash.net.Responder;
    import mx.events.CloseEvent;
    import mx.managers.PopUpManager;
    import com.qeedoo.game.view.ViewManager;
    import mx.core.IUITextField;
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

    public class TitleCustomPanel extends DragableCanvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _titleIndex:Number = 0;
        private var _1870024861titleEnd:ComboBox;
        private var _1870014165titlePre:ComboBox;
        private var _891535336submit:Button;
        private var _titlePre:String;
        private var parentCbFunc:Function;
        private var _titleMid:String;
        private var _607740351labelText:Label;
        private var _1870017328titleMid:ComboBox;
        private var _titleNext:String;
        private var _1307249261titleId:BasicTitleCanvas;
        private var _titleUpdateAlert:Alert;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":DragableCanvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":352,
                    "height":138,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":BasicTitleCanvas,
                        "id":"titleId"
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "percentWidth":100,
                                "height":128,
                                "y":30,
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":ComboBox,
                                    "id":"titleEnd",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":5.5,
                                            "y":41,
                                            "width":139,
                                            "labelField":"label"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ComboBox,
                                    "id":"titleMid",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":150.5,
                                            "y":41,
                                            "width":65,
                                            "labelField":"label",
                                            "visible":true
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":ComboBox,
                                    "id":"titlePre",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":221.5,
                                            "y":41,
                                            "width":123.5,
                                            "labelField":"label"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"submit",
                                    "events":{"click":"__submit_click"},
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":77,
                                            "width":67,
                                            "label":"OK",
                                            "styleName":"BtnStdRed"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"labelText",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":19.5,
                                            "y":15,
                                            "text":"Label"
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
        private var midArr:Array = new Array({
            "label":"quá",
            "data":1
        }, {
            "label":"rất",
            "data":2
        }, {
            "label":"cực",
            "data":3
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function TitleCustomPanel()
        {
            mx_internal::_document = this;
            this.width = 352;
            this.height = 138;
            this.styleName = "StandardContent";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TitleCustomPanel._watcherSetupUtil = _arg_1;
        }


        public function __submit_click(_arg_1:MouseEvent):void
        {
            setTitleName();
        }

        public function set labelText(_arg_1:Label):void
        {
            var _local_2:Object = this._607740351labelText;
            if (_local_2 !== _arg_1)
            {
                this._607740351labelText = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "labelText", _local_2, _arg_1));
            };
        }

        public function parentCallback(_arg_1:Function):void
        {
            parentCbFunc = _arg_1;
        }

        [Bindable(event="propertyChange")]
        public function get titleId():BasicTitleCanvas
        {
            return (this._1307249261titleId);
        }

        override public function initialize():void
        {
            var target:TitleCustomPanel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TitleCustomPanel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_compDragable_TitleCustomPanelWatcherSetupUtil");
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

        private function _TitleCustomPanel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = Language.TITLE_CUSTOM[1];
        }

        public function set titleMid(_arg_1:ComboBox):void
        {
            var _local_2:Object = this._1870017328titleMid;
            if (_local_2 !== _arg_1)
            {
                this._1870017328titleMid = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "titleMid", _local_2, _arg_1));
            };
        }

        public function set titleId(_arg_1:BasicTitleCanvas):void
        {
            var _local_2:Object = this._1307249261titleId;
            if (_local_2 !== _arg_1)
            {
                this._1307249261titleId = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "titleId", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get submit():Button
        {
            return (this._891535336submit);
        }

        private function _TitleCustomPanel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.TITLE_CUSTOM[1];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                titleId.text = _arg_1;
            }, "titleId.text");
            result[0] = binding;
            return (result);
        }

        public function set submit(_arg_1:Button):void
        {
            var _local_2:Object = this._891535336submit;
            if (_local_2 !== _arg_1)
            {
                this._891535336submit = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "submit", _local_2, _arg_1));
            };
        }

        public function initTitleContent(_arg_1:Number):void
        {
            var _local_2:Array;
            var _local_3:*;
            var _local_4:Array;
            var _local_5:*;
            if (((GamePredef.TITLE_NEXT[_arg_1]) && (GamePredef.TITLE_PRE[_arg_1])))
            {
                _local_2 = new Array();
                for (_local_3 in GamePredef.TITLE_PRE[_arg_1])
                {
                    _local_5 = new Object();
                    _local_5.label = GamePredef.TITLE_PRE[_arg_1][_local_3];
                    _local_5.data = _local_3;
                    _local_2.push(_local_5);
                };
                this.titlePre.dataProvider = _local_2;
                this.titleMid.dataProvider = midArr;
                _local_4 = new Array();
                for (_local_3 in GamePredef.TITLE_NEXT[_arg_1])
                {
                    _local_5 = new Object();
                    _local_5.label = GamePredef.TITLE_NEXT[_arg_1][_local_3];
                    _local_5.data = _local_3;
                    _local_4.push(_local_5);
                };
                this.titleEnd.dataProvider = _local_4;
                _titleIndex = _arg_1;
                this.labelText.text = GamePredef.TITLE_LABLE[_arg_1][2].toString();
                this.titleId.text = GamePredef.TITLE_LABLE[_arg_1][1].toString();
                this.visible = true;
            };
        }

        [Bindable(event="propertyChange")]
        public function get titlePre():ComboBox
        {
            return (this._1870014165titlePre);
        }

        private function setTitleName():void
        {
            var handler:Function;
            var i:* = undefined;
            handler = function (_arg_1:CloseEvent):void
            {
                if (_arg_1.detail == Alert.YES)
                {
                    _core.remote.call("setCustomTitle", new Responder(onSetCustomTitle), _titleIndex, _titlePre, _titleMid, _titleNext);
                };
                if (_arg_1.detail == Alert.NO)
                {
                };
            };
            if (_titleUpdateAlert)
            {
                PopUpManager.removePopUp(_titleUpdateAlert);
                _titleUpdateAlert = null;
            };
            var titleAdd:String = ((((this.titleEnd.selectedItem.label + " ") + this.titleMid.selectedItem.label) + " ") + this.titlePre.selectedItem.label);
            _titleMid = this.titleMid.selectedItem.data;
            _titlePre = this.titlePre.selectedItem.data;
            _titleNext = this.titleEnd.selectedItem.data;
            var titleName:String = Language.TITLE_CUSTOM[0].toString().replace("{title}", titleAdd);
            var obj:* = _core.view.getUI(ViewManager.MAIN_LONGBUFF);
            if (((obj) && (obj.rp)))
            {
                for (i in obj.rp.dataProvider)
                {
                    if (((((obj.rp.dataProvider) && (obj.rp.dataProvider[i])) && (obj.rp.dataProvider[i].bid)) && (obj.rp.dataProvider[i].bid == GamePredef.TITLE_POINT[_titleIndex][2])))
                    {
                        titleName = Language.TITLE_CUSTOM[4].toString();
                    };
                };
            };
            _titleUpdateAlert = Alert.show(titleName, null, (Alert.YES | Alert.NO), null, handler);
            var tf:IUITextField = _titleUpdateAlert.mx_internal::alertForm.mx_internal::textField;
            tf.htmlText = titleName;
            tf.filters = GamePredef.FILTER_TEXT1;
        }

        public function set titleEnd(_arg_1:ComboBox):void
        {
            var _local_2:Object = this._1870024861titleEnd;
            if (_local_2 !== _arg_1)
            {
                this._1870024861titleEnd = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "titleEnd", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get labelText():Label
        {
            return (this._607740351labelText);
        }

        [Bindable(event="propertyChange")]
        public function get titleMid():ComboBox
        {
            return (this._1870017328titleMid);
        }

        public function set titlePre(_arg_1:ComboBox):void
        {
            var _local_2:Object = this._1870014165titlePre;
            if (_local_2 !== _arg_1)
            {
                this._1870014165titlePre = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "titlePre", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get titleEnd():ComboBox
        {
            return (this._1870024861titleEnd);
        }

        public function onSetCustomTitle(_arg_1:Object):void
        {
            if (((this) && (this.visible)))
            {
                this.visible = false;
            };
            if (parentCbFunc)
            {
                parentCbFunc();
            };
        }


    }
}//package com.qeedoo.ui.view.compDragable

