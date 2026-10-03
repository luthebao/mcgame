// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.CrossTeamFightActiveTeamInfo

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.binding.IBindingClient;
    import mx.binding.IWatcherSetupUtil;
    import mx.controls.Image;
    import mx.controls.Label;
    import mx.controls.TextArea;
    import mx.core.UIComponentDescriptor;
    import mx.core.mx_internal;
    import mx.events.PropertyChangeEvent;
    import com.qeedoo.ui.resource.ResManager;
    import com.qeedoo.game.predef.GamePredef;
    import com.qeedoo.game.config.Language;
    import flash.utils.getDefinitionByName;
    import mx.binding.Binding;
    import com.qeedoo.ui.view.compDragable.CrossTeamFightPanel;
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

    public class CrossTeamFightActiveTeamInfo extends Canvas implements IBindingClient 
    {

        private static var _watcherSetupUtil:IWatcherSetupUtil;

        private var _3469809rImg:Image;
        public var _CrossTeamFightActiveTeamInfo_Image1:Image;
        private var _1668760952teamName:Label;
        private var _1191282484leaderName:Label;
        public var _CrossTeamFightActiveTeamInfo_Image2:Image;
        public var _CrossTeamFightActiveTeamInfo_Label5:Label;
        public var _CrossTeamFightActiveTeamInfo_Label3:Label;
        private var _1341350843memberName:TextArea;
        private var _1666338632areaName:Label;

        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":250,
                    "height":125,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":Canvas,
                        "stylesFactory":function ():void
                        {
                            this.borderThickness = 2;
                        },
                        "propertiesFactory":function ():Object
                        {
                            return ({
                                "x":0,
                                "y":0,
                                "width":250,
                                "percentHeight":100,
                                "horizontalScrollPolicy":"off",
                                "verticalScrollPolicy":"off",
                                "childDescriptors":[new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"_CrossTeamFightActiveTeamInfo_Image1"
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"_CrossTeamFightActiveTeamInfo_Image2",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "0";
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({"y":5});
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"teamName",
                                    "stylesFactory":function ():void
                                    {
                                        this.fontSize = 13;
                                        this.color = 0xFFFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":54,
                                            "y":15,
                                            "width":90
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"areaName",
                                    "stylesFactory":function ():void
                                    {
                                        this.horizontalCenter = "73";
                                        this.fontSize = 13;
                                        this.color = 0xFFFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "y":15,
                                            "width":86
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_CrossTeamFightActiveTeamInfo_Label3",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":5,
                                            "y":46,
                                            "width":45
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"leaderName",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFFFF;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":160,
                                            "x":50,
                                            "y":46
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Label,
                                    "id":"_CrossTeamFightActiveTeamInfo_Label5",
                                    "stylesFactory":function ():void
                                    {
                                        this.color = 0xFFFF00;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "x":5,
                                            "y":66,
                                            "width":45
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":TextArea,
                                    "id":"memberName",
                                    "stylesFactory":function ():void
                                    {
                                        this.backgroundAlpha = 0;
                                        this.color = 0xFFFFFF;
                                        this.borderThickness = 0;
                                    },
                                    "propertiesFactory":function ():Object
                                    {
                                        return ({
                                            "width":160,
                                            "selectable":false,
                                            "height":55,
                                            "x":50,
                                            "y":66,
                                            "horizontalScrollPolicy":"off",
                                            "verticalScrollPolicy":"off"
                                        });
                                    }
                                }), new UIComponentDescriptor({
                                    "type":Image,
                                    "id":"rImg",
                                    "stylesFactory":function ():void
                                    {
                                        this.right = "2";
                                        this.verticalCenter = "0";
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

        public function CrossTeamFightActiveTeamInfo()
        {
            mx_internal::_document = this;
            this.width = 250;
            this.height = 125;
        }

        public static function set watcherSetupUtil(_arg_1:IWatcherSetupUtil):void
        {
            CrossTeamFightActiveTeamInfo._watcherSetupUtil = _arg_1;
        }


        [Bindable(event="propertyChange")]
        public function get leaderName():Label
        {
            return (this._1191282484leaderName);
        }

        [Bindable(event="propertyChange")]
        public function get memberName():TextArea
        {
            return (this._1341350843memberName);
        }

        [Bindable(event="propertyChange")]
        public function get teamName():Label
        {
            return (this._1668760952teamName);
        }

        public function set teamName(_arg_1:Label):void
        {
            var _local_2:Object = this._1668760952teamName;
            if (_local_2 !== _arg_1)
            {
                this._1668760952teamName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "teamName", _local_2, _arg_1));
            };
        }

        public function init():void
        {
            teamName.text = "";
            leaderName.text = "";
            memberName.text = "";
        }

        public function set memberName(_arg_1:TextArea):void
        {
            var _local_2:Object = this._1341350843memberName;
            if (_local_2 !== _arg_1)
            {
                this._1341350843memberName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "memberName", _local_2, _arg_1));
            };
        }

        private function _CrossTeamFightActiveTeamInfo_bindingExprs():void
        {
            var _local_1:*;
            _local_1 = ResManager.getIconUrl(4130220000240);
            _local_1 = ResManager.getIconUrl(4130220000236);
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[124];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = Language.CROSS_FIGHT_PANEL_U[125];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
            _local_1 = [GamePredef.FILTER_ROUNDED_TEXT2];
        }

        override public function initialize():void
        {
            var target:CrossTeamFightActiveTeamInfo;
            var watcherSetupUtilClass:Object;
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            var bindings:Array = _CrossTeamFightActiveTeamInfo_bindingsSetup();
            var watchers:Array = [];
            target = this;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_qeedoo_ui_view_comp_CrossTeamFightActiveTeamInfoWatcherSetupUtil");
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

        public function refresh(_arg_1:Object, _arg_2:Object, _arg_3:int):void
        {
            var _local_4:String;
            var _local_5:int;
            var _local_6:Object;
            if (!_arg_1)
            {
                init();
                return;
            };
            teamName.text = _arg_1.teamName;
            areaName.text = (("(" + _arg_1.area) + ")");
            leaderName.text = _arg_1.leaderName;
            for (_local_4 in _arg_1.members)
            {
                _local_6 = _arg_1.members[_local_4];
                if (Number(_local_4) != Number(_arg_1.leaderId))
                {
                    memberName.text = (memberName.text + (_local_6.cname + "\n"));
                };
            };
            _local_5 = CrossTeamFightPanel.TEAM_CROSSPK_STATE;
            if (!_arg_2)
            {
                rImg.source = ResManager.getIconUrl(4130220000280);
            }
            else
            {
                if ((((_arg_2) && (_arg_3 == 4)) && ((!(_arg_1.win)) || (Number(_arg_2.leaderId) == _arg_1.win))))
                {
                    rImg.source = ResManager.getIconUrl(4130220000281);
                }
                else
                {
                    if (Number(_arg_1.leaderId) == _arg_1.win)
                    {
                        rImg.source = ResManager.getIconUrl(4130220000226);
                    }
                    else
                    {
                        if (((_arg_2) && (Number(_arg_2.leaderId) == _arg_1.win)))
                        {
                            rImg.source = ResManager.getIconUrl(4130220000227);
                        }
                        else
                        {
                            rImg.source = null;
                        };
                    };
                };
            };
        }

        public function set leaderName(_arg_1:Label):void
        {
            var _local_2:Object = this._1191282484leaderName;
            if (_local_2 !== _arg_1)
            {
                this._1191282484leaderName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "leaderName", _local_2, _arg_1));
            };
        }

        public function set rImg(_arg_1:Image):void
        {
            var _local_2:Object = this._3469809rImg;
            if (_local_2 !== _arg_1)
            {
                this._3469809rImg = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rImg", _local_2, _arg_1));
            };
        }

        private function _CrossTeamFightActiveTeamInfo_bindingsSetup():Array
        {
            var binding:Binding;
            var result:Array = [];
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000240));
            }, function (_arg_1:Object):void
            {
                _CrossTeamFightActiveTeamInfo_Image1.source = _arg_1;
            }, "_CrossTeamFightActiveTeamInfo_Image1.source");
            result[0] = binding;
            binding = new Binding(this, function ():Object
            {
                return (ResManager.getIconUrl(4130220000236));
            }, function (_arg_1:Object):void
            {
                _CrossTeamFightActiveTeamInfo_Image2.source = _arg_1;
            }, "_CrossTeamFightActiveTeamInfo_Image2.source");
            result[1] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                teamName.filters = _arg_1;
            }, "teamName.filters");
            result[2] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                areaName.filters = _arg_1;
            }, "areaName.filters");
            result[3] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[124];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossTeamFightActiveTeamInfo_Label3.text = _arg_1;
            }, "_CrossTeamFightActiveTeamInfo_Label3.text");
            result[4] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _CrossTeamFightActiveTeamInfo_Label3.filters = _arg_1;
            }, "_CrossTeamFightActiveTeamInfo_Label3.filters");
            result[5] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                leaderName.filters = _arg_1;
            }, "leaderName.filters");
            result[6] = binding;
            binding = new Binding(this, function ():String
            {
                var _local_1:* = Language.CROSS_FIGHT_PANEL_U[125];
                return ((_local_1 == undefined) ? null : String(_local_1));
            }, function (_arg_1:String):void
            {
                _CrossTeamFightActiveTeamInfo_Label5.text = _arg_1;
            }, "_CrossTeamFightActiveTeamInfo_Label5.text");
            result[7] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                _CrossTeamFightActiveTeamInfo_Label5.filters = _arg_1;
            }, "_CrossTeamFightActiveTeamInfo_Label5.filters");
            result[8] = binding;
            binding = new Binding(this, function ():Array
            {
                return ([GamePredef.FILTER_ROUNDED_TEXT2]);
            }, function (_arg_1:Array):void
            {
                memberName.filters = _arg_1;
            }, "memberName.filters");
            result[9] = binding;
            return (result);
        }

        public function set areaName(_arg_1:Label):void
        {
            var _local_2:Object = this._1666338632areaName;
            if (_local_2 !== _arg_1)
            {
                this._1666338632areaName = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "areaName", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get rImg():Image
        {
            return (this._3469809rImg);
        }

        [Bindable(event="propertyChange")]
        public function get areaName():Label
        {
            return (this._1666338632areaName);
        }


    }
}//package com.qeedoo.ui.view.comp

