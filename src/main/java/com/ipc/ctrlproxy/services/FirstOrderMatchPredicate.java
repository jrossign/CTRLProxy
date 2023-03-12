package com.ipc.ctrlproxy.services;

import com.ipc.ctrlproxy.model.ctrl.detail.Details;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Setter;

import java.util.concurrent.atomic.AtomicReference;
import java.util.function.Predicate;

@Builder
public class FirstOrderMatchPredicate implements Predicate<Details> {
    private
    Details toMatch;

    @Setter(AccessLevel.PRIVATE)
    private final AtomicReference<Details> matched = new AtomicReference<>(null);

    public FirstOrderMatchPredicate(Details d) {
        this.toMatch = d;
    }
    @Override
    public boolean test(Details d) {
        if (matched.get() == null) {
            if ((Double.parseDouble(d.getTransaction1Quantite()) == Double.parseDouble(toMatch.getTransaction2Quantite())) && hasEnoughSuspendedQty(d, toMatch)) {
                matched.set(d);
                return true;
            }
        }
        return false;
    }

    private boolean hasEnoughSuspendedQty(Details d, Details toMatch) {
        double toReceive = Double.parseDouble(toMatch.getTransaction2Quantite());
        double left = Double.parseDouble(d.getQuantiteSuspend());

        return toReceive <= left;
    }

    public Details getMatched() {
        return matched.get();
    }

}