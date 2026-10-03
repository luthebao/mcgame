// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.CrossTeamFightActiveLine

package com.qeedoo.ui.view.comp
{
    import mx.containers.Canvas;
    import mx.core.UIComponentDescriptor;
    import mx.controls.Image;
    import mx.core.mx_internal;
    import com.qeedoo.ui.view.compDragable.CrossTeamFightPanel;
    import com.qeedoo.ui.resource.ResManager;
    import mx.events.PropertyChangeEvent;
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

    public class CrossTeamFightActiveLine extends Canvas 
    {

        private var _110233973team2:CrossTeamFightActiveTeamInfo;
        private var _110233972team1:CrossTeamFightActiveTeamInfo;
        private var _documentDescriptor_:UIComponentDescriptor = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function ():Object
            {
                return ({
                    "width":615,
                    "height":113,
                    "childDescriptors":[new UIComponentDescriptor({
                        "type":CrossTeamFightActiveTeamInfo,
                        "id":"team1"
                    }), new UIComponentDescriptor({
                        "type":Image,
                        "id":"vs",
                        "stylesFactory":function ():void
                        {
                            this.horizontalCenter = "0";
                            this.verticalCenter = "0";
                        }
                    }), new UIComponentDescriptor({
                        "type":CrossTeamFightActiveTeamInfo,
                        "id":"team2",
                        "stylesFactory":function ():void
                        {
                            this.right = "0";
                        }
                    })]
                });
            }
        });
        private var _3773vs:Image;

        public function CrossTeamFightActiveLine()
        {
            mx_internal::_document = this;
            this.width = 615;
            this.height = 113;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
        }

        public function set refreshData(_arg_1:Object):void
        {
            if (((_arg_1) && (_arg_1.team1)))
            {
                _arg_1.team1.win = _arg_1.win;
            };
            if (((_arg_1) && (_arg_1.team2)))
            {
                _arg_1.team2.win = _arg_1.win;
            };
            var _local_2:int = CrossTeamFightPanel.TEAM_CROSSPK_STATE;
            if (_local_2 >= 5)
            {
                vs.source = ResManager.getIconUrl(4130220000243);
            }
            else
            {
                vs.source = ResManager.getIconUrl(4130220000237);
            };
            team1.refresh(_arg_1.team1, _arg_1.team2, _arg_1.status);
            team2.refresh(_arg_1.team2, _arg_1.team1, _arg_1.status);
        }

        public function set team1(_arg_1:CrossTeamFightActiveTeamInfo):void
        {
            var _local_2:Object = this._110233972team1;
            if (_local_2 !== _arg_1)
            {
                this._110233972team1 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "team1", _local_2, _arg_1));
            };
        }

        override public function initialize():void
        {
            (mx_internal::setDocumentDescriptor(_documentDescriptor_));
            super.initialize();
        }

        public function set team2(_arg_1:CrossTeamFightActiveTeamInfo):void
        {
            var _local_2:Object = this._110233973team2;
            if (_local_2 !== _arg_1)
            {
                this._110233973team2 = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "team2", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get team1():CrossTeamFightActiveTeamInfo
        {
            return (this._110233972team1);
        }

        [Bindable(event="propertyChange")]
        public function get team2():CrossTeamFightActiveTeamInfo
        {
            return (this._110233973team2);
        }

        public function set vs(_arg_1:Image):void
        {
            var _local_2:Object = this._3773vs;
            if (_local_2 !== _arg_1)
            {
                this._3773vs = _arg_1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vs", _local_2, _arg_1));
            };
        }

        [Bindable(event="propertyChange")]
        public function get vs():Image
        {
            return (this._3773vs);
        }

        public function init():void
        {
            team1.init();
            team2.init();
        }


    }
}//package com.qeedoo.ui.view.comp

