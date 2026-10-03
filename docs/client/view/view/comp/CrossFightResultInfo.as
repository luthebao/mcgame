// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.CrossFightResultInfo

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.controls.Image;
    import mx.controls.ComboBox;
    import mx.core.UIComponentDescriptor;
    import mx.collections.ArrayCollection;
    import com.qeedoo.game.system.Core;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.net.Responder;
    import flash.events.MouseEvent;
    import mx.events.FlexEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.game.config.Language;
    import com.qeedoo.ui.resource.ResManager;
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

    public class CrossFightResultInfo extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _112797rep:BasicDelayButton;
        private var _746483037areaTxt:Label;
        private var _104387img:Image;
        private var _data:Object;
        private var _1721941989nameTxt:Label;
        private var _3496822reps:ComboBox;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":160,
                    "height":60,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "width":160,
                                "height":36,
                                "styleName":"CanvasBorder",
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"nameTxt",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "3";
                                        this.top = "3";
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"width":160});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"areaTxt",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "3";
                                        this.bottom = "3";
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"width":160});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"img",
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":100,
                                            "y":0
                                        });
                                    }
                                })]
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":BasicDelayButton,
                        "id":"rep",
                        "events":{"click":"__rep_click"},
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "visible":false,
                                "height":24,
                                "styleName":"BtnNormalBlue",
                                "label":"",
                                "x":90,
                                "y":35
                            });
                        }
                    }), new UIComponentDescriptor({
                        "type":ComboBox,
                        "id":"reps",
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":2,
                                "y":35,
                                "width":85
                            });
                        }
                    })]
                });
            }
        });
        private var _469523524repArray:ArrayCollection = new ArrayCollection();
        private var _core:Core = Core.getInstance();
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function CrossFightResultInfo()
        {
            mx_internal::_document = this;
            this.width = 160;
            this.height = 60;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
            this.addEventListener("creationComplete", ___CrossFightResultInfo_Canvas1_creationComplete);
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            CrossFightResultInfo._watcherSetupUtil = _arg_1;
        }


        public function set rep(_arg_1:BasicDelayButton):void
        {
            var _local_2:Object = this._112797rep;
            if (_local_2 !== _arg_1)
            {
                this._112797rep = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rep", _local_2, _arg_1));
            };
        }

        private function toLookRep():void
        {
            var _local_1:Object = reps.selectedItem;
            if (((_local_1.data) && (_local_1.data.length > 0)))
            {
                _core.remote.call("crossPKLookReplay", new Responder(onLookRep), _local_1.data);
            };
        }

        private function _CrossFightResultInfo_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = repArray;
        }

        public function __rep_click(_arg_1:MouseEvent):void
        {
            toLookRep();
        }

        public function ___CrossFightResultInfo_Canvas1_creationComplete(_arg_1:FlexEvent):void
        {
            init();
        }

        [Bindable(event="propertyChange")]
        private function get repArray():ArrayCollection
        {
            return (this._469523524repArray);
        }

        public function set areaTxt(_arg_1:Label):void
        {
            var _local_2:Object = this._746483037areaTxt;
            if (_local_2 !== _arg_1)
            {
                this._746483037areaTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "areaTxt", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            var target:CrossFightResultInfo;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _CrossFightResultInfo_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_CrossFightResultInfoWatcherSetupUtil");
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

        private function _CrossFightResultInfo_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Object
            {
                return (repArray);
            }, function (_arg_1:Object):void
            {
                reps.dataProvider = _arg_1;
            }, "reps.dataProvider");
            result[0] = binding;
            return (result);
        }

        public function set img(_arg_1:Image):void
        {
            var _local_2:Object = this._104387img;
            if (_local_2 !== _arg_1)
            {
                this._104387img = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img", _local_2, _arg_1));
            };
        }

        public function refresh(_arg_1:Object, _arg_2:Object):void
        {
            if (((_arg_1) && (_arg_2)))
            {
                _data = _arg_1;
                nameTxt.text = (Language.CROSS_FIGHT_PANEL_U[52] + _arg_2.tname);
                areaTxt.text = (Language.CROSS_FIGHT_PANEL_U[25] + _arg_2.tarea);
                if (((_arg_1.rid) && (_arg_1.rid.toString().length > 0)))
                {
                    if (_arg_1.bid <= 11)
                    {
                        rep.label = Language.CROSS_FIGHT_PANEL_U[53];
                    }
                    else
                    {
                        if (_arg_1.bid <= 13)
                        {
                            rep.label = Language.CROSS_FIGHT_PANEL_U[54];
                        }
                        else
                        {
                            rep.label = Language.CROSS_FIGHT_PANEL_U[55];
                        };
                    };
                    rep.visible = true;
                    reps.visible = true;
                    getReps();
                };
                if (_arg_1.type == 1)
                {
                    img.source = ResManager.getIconUrl(4130220000226);
                }
                else
                {
                    if (_arg_1.type == 2)
                    {
                        img.source = ResManager.getIconUrl(4130220000227);
                    }
                    else
                    {
                        if (_arg_1.type == 3)
                        {
                            img.source = ResManager.getIconUrl(4130220000228);
                        }
                        else
                        {
                            img.source = "";
                        };
                    };
                };
            }
            else
            {
                init();
            };
        }

        public function set nameTxt(_arg_1:Label):void
        {
            var _local_2:Object = this._1721941989nameTxt;
            if (_local_2 !== _arg_1)
            {
                this._1721941989nameTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nameTxt", _local_2, _arg_1));
            };
        }

        public function init():void
        {
            nameTxt.text = Language.CROSS_FIGHT_PANEL_U[52];
            areaTxt.text = Language.CROSS_FIGHT_PANEL_U[25];
            rep.label = "";
            rep.visible = false;
            reps.visible = false;
            img.source = "";
            data = null;
        }

        [Bindable(event="propertyChange")]
        public function get areaTxt():Label
        {
            return (this._746483037areaTxt);
        }

        [Bindable(event="propertyChange")]
        public function get rep():BasicDelayButton
        {
            return (this._112797rep);
        }

        [Bindable(event="propertyChange")]
        public function get img():Image
        {
            return (this._104387img);
        }

        private function onLookRep(_arg_1:Object):void
        {
            if (!_arg_1)
            {
                _core.sysMsg(Language.CROSS_FIGHT_PANEL_U[50]);
            };
        }

        [Bindable(event="propertyChange")]
        public function get reps():ComboBox
        {
            return (this._3496822reps);
        }

        public function set reps(_arg_1:ComboBox):void
        {
            var _local_2:Object = this._3496822reps;
            if (_local_2 !== _arg_1)
            {
                this._3496822reps = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "reps", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get nameTxt():Label
        {
            return (this._1721941989nameTxt);
        }

        private function set repArray(_arg_1:ArrayCollection):void
        {
            var _local_2:Object = this._469523524repArray;
            if (_local_2 !== _arg_1)
            {
                this._469523524repArray = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "repArray", _local_2, _arg_1));
            };
        }

        private function getReps():void
        {
            var _local_1:String;
            var _local_2:Array;
            var _local_3:int;
            repArray.removeAll();
            if ((((_data) && (_data.rid)) && (_data.rid.toString().length > 0)))
            {
                _local_1 = _data.rid;
                _local_2 = _local_1.split("#");
                _local_3 = 0;
                while (_local_3 < _local_2.length)
                {
                    repArray.addItem({
                        "label":((Language.CROSS_FIGHT_PANEL_U[56] + Language.GAMEPREDEF_S[(544 + _local_3)]) + Language.CROSS_FIGHT_PANEL_U[57]),
                        "data":_local_2[_local_3]
                    });
                    _local_3++;
                };
            };
        }


    }
}//package com.qeedoo.ui.view.comp

