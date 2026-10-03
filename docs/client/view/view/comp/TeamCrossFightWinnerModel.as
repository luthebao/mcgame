// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.TeamCrossFightWinnerModel

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Label;
    import mx.controls.Image;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.predef.GamePredef;
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

    public class TeamCrossFightWinnerModel extends Canvas implements IBindingClient 
    {

        private static var bmUrl:Array = [4130220000287, 4130220000288, 4130220000289, 4130220000291];
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _1090741522lvlTxt:Label;
        private var _104387img:Image;
        private var _index:int = -1;
        private var _1721941989nameTxt:RoundedLabel;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":190,
                    "height":230,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Image,
                        "id":"img",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                        }
                    }), new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "percentWidth":100,
                                "percentHeight":100,
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":RoundedLabel,
                                    "id":"nameTxt",
                                    "stylesFactory":function ():void
                                    {
                                        this.textAlign = "center";
                                        this.top = "116";
                                        this.horizontalCenter = "0";
                                        this.color = 0xFFFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":175,
                                            "height":20
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"lvlTxt",
                                    "stylesFactory":function ():void
                                    {
                                        this.left = "3";
                                        this.bottom = "30";
                                        this.color = 0xFFFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":175,
                                            "height":20
                                        });
                                    }
                                })]
                            });
                        }
                    })]
                });
            }
        });
        mx_internal var _bindings:Array = [];
        mx_internal var _watchers:Array = [];
        mx_internal var _bindingsByDestination:Object = {};
        mx_internal var _bindingsBeginWithWord:Object = {};

        public function TeamCrossFightWinnerModel()
        {
            mx_internal::_document = this;
            this.width = 190;
            this.height = 230;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            TeamCrossFightWinnerModel._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get img():Image
        {
            return (this._104387img);
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

        override public function initialize():void
        {
            var target:TeamCrossFightWinnerModel;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _TeamCrossFightWinnerModel_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_TeamCrossFightWinnerModelWatcherSetupUtil");
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

        public function set nameTxt(_arg_1:RoundedLabel):void
        {
            var _local_2:Object = this._1721941989nameTxt;
            if (_local_2 !== _arg_1)
            {
                this._1721941989nameTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nameTxt", _local_2, _arg_1));
            };
        }

        public function resetModel():void
        {
            nameTxt.text = "";
        }

        public function refresh(_arg_1:Object, _arg_2:String):void
        {
            var _local_4:Object;
            var _local_8:Object;
            var _local_9:Object;
            if (((!(_arg_1)) || (!(_arg_1.team))))
            {
                resetModel();
                return;
            };
            var _local_3:Object = _arg_1.list;
            if (((((!(_local_3)) || (!(_local_3[_arg_2]))) || (!(_local_3[_arg_2][2]))) || (!(_local_3[_arg_2][2][0]))))
            {
                resetModel();
                return;
            };
            var _local_5:Object = _local_3[_arg_2][2][0];
            if (_local_5.status == 3)
            {
                _local_4 = _arg_1.team[_arg_2][_local_5[1]];
            }
            else
            {
                if (!_local_5.win)
                {
                    resetModel();
                    return;
                };
                _local_4 = _arg_1.team[_arg_2][_local_5.win];
            };
            if (((!(_local_4)) || (!(_local_4.members))))
            {
                resetModel();
                return;
            };
            var _local_6:Object = _local_4.members;
            var _local_7:Array = [_local_6[_local_4.leader].view];
            for (_local_8 in _local_6)
            {
                if (((!(_local_8 == _local_4.leader)) && (_local_6[_local_8])))
                {
                    _local_7.push(_local_6[_local_8].view);
                };
            };
            _local_9 = _local_7[_index];
            if (!_local_9)
            {
                resetModel();
                return;
            };
            nameTxt.text = _local_9.name;
        }

        public function set lvlTxt(_arg_1:Label):void
        {
            var _local_2:Object = this._1090741522lvlTxt;
            if (_local_2 !== _arg_1)
            {
                this._1090741522lvlTxt = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lvlTxt", _local_2, _arg_1));
            };
        }

        public function init(_arg_1:int):void
        {
            _index = _arg_1;
            if (_index == 0)
            {
                img.y = 0;
            }
            else
            {
                img.y = 0;
            };
            img.source = ResManager.getIconUrl(bmUrl[_index]);
        }

        private function _TeamCrossFightWinnerModel_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT4];
        }

        [Bindable(event="propertyChange")]
        public function get nameTxt():RoundedLabel
        {
            return (this._1721941989nameTxt);
        }

        private function _TeamCrossFightWinnerModel_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT4]);
            }, function (_arg_1:Array):void
            {
                nameTxt.filters = _arg_1;
            }, "nameTxt.filters");
            result[0] = binding;
            return (result);
        }

        [Bindable(event="propertyChange")]
        public function get lvlTxt():Label
        {
            return (this._1090741522lvlTxt);
        }


    }
}//package com.qeedoo.ui.view.comp

