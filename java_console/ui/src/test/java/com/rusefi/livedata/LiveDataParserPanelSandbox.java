package com.rusefi.livedata;

import com.rusefi.config.Field;
import com.rusefi.config.generated.BoostControl;
import com.rusefi.ldmp.StateDictionary;
import com.rusefi.ui.UIContext;
import com.rusefi.ui.livedocs.LiveDocsRegistry;
import com.rusefi.ui.util.FrameHelper;
import org.jetbrains.annotations.NotNull;

import javax.swing.*;

/**
 * TODO: no point in this class kill it?
 * @see LiveDataParserSandbox
 */
public class LiveDataParserPanelSandbox {
    private final static LiveDataView liveDataView = LiveDataView.BOOST_CONTROL;

    public static void main(String[] args) {

        UIContext context = new UIContext();

        JPanel panel = createLiveDataParserContent(context,
                liveDataView);

        Field[] values = StateDictionary.INSTANCE.getFields(liveDataView.getLiveDataE());
        int size = Field.getStructureSize(values);
        byte[] state = new byte[size];


        Field.findFieldOrNull(values, "", BoostControl.ISTPSINVALID.getName()).setValue(state, true);
        Field.findFieldOrNull(values, "", BoostControl.ISNOTCLOSEDLOOP.getName()).setValue(state, true);

        LiveDocsRegistry.INSTANCE.refresh(context1 -> state
        );

        new FrameHelper().showFrame(panel);
    }

    @NotNull
    private static JPanel createLiveDataParserContent(UIContext uiContext, LiveDataView view) {
        LiveDataParserPanel panel = LiveDataParserPanel.createLiveDataParserPanel(uiContext, view.getLiveDataE(), view.getValues(), view.getFileName());
        return panel.getContent();
    }
}
